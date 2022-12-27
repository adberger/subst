package subst

import (
	"fmt"
	"os"

	"github.com/buttahtoast/subst/pkg/utils"
	"sigs.k8s.io/kustomize/api/filesys"
	"sigs.k8s.io/kustomize/api/krusty"
	kustypes "sigs.k8s.io/kustomize/api/types"
)

// Resolves all paths from the kustomization file
func (b *Build) kustomizePaths(path string) error {
	path = utils.ConvertPath(path)
	kz, err := utils.ReadKustomize(path)
	if err != nil {
		return err
	}
	for _, resource := range kz.Resources {
		p := fmt.Sprintf("%v%v", path, resource)
		file, err := os.Stat(p)
		if os.IsNotExist(err) {
			return err
		}
		if file.IsDir() {
			p = utils.ConvertPath(p)
			b.Paths = append(b.Paths, p)
			err := b.kustomizePaths(p)
			if err != nil {
				return err
			}
		}
	}
	return nil
}

func (b *Build) kustomizeBuild() error {
	fs := filesys.MakeFsOnDisk()

	buildOptions := &krusty.Options{
		DoLegacyResourceSort: true,
		LoadRestrictions:     kustypes.LoadRestrictionsNone,
		AddManagedbyLabel:    false,
		DoPrune:              false,
		PluginConfig:         kustypes.DisabledPluginConfig(),
	}
	k := krusty.MakeKustomizer(buildOptions)
	build, err := k.Run(fs, b.entryPath)
	if err != nil {
		return err
	}

	for _, m := range build.Resources() {
		n, err := NewManifest(m)
		if err != nil {
			return err
		}
		b.Manifests = append(b.Manifests, n)
	}
	return nil
}