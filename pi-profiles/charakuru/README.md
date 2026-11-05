# Charakuru (きゃらくる) sandbox project

Profile for a local Charakuru kit checkout used to make VRM avatars from one character
illustration. The kit is source-available and distributed as a ZIP through
<https://github.com/nanocle/Charakuru/releases>; the GitHub "Source code" archive does not
contain the app.

## Layout on this machine

| Path | Purpose |
| --- | --- |
| `~/Projects/Sandbox/charakuru` | extracted kit (v1.1.1), local T3 project workspace |
| `~/Projects/Sandbox/charakuru/exports/avatar.vrm` | exported VRM 1.0 avatar |
| `~/Projects/Sandbox/charakuru/exports/avatar.blend` | matching editable Blend |
| `~/Projects/Sandbox/charakuru/blender-out/` | scratch scripts and inspection renders (not kit-shipped) |

## Requirements

- Node.js 22 or later. `npm start` needs no `npm install`.
- A desktop Chromium-based browser.
- Blender 5.2 with the [VRM Add-on for Blender](https://github.com/saturday06/VRM-Addon-for-Blender).
  Install the `VRM_Addon_for_Blender-Extension` ZIP with
  `blender.exe --command extension install-file -r user_default --enable <zip>`.
- Blender MCP (`blender_mcp`) enabled for the agent-driven workflow.
- Tripo account and credits, plus an image-generation capable agent, only when the
  image and 3D stages are actually run.

## T3 project

Registered project `charakuru` with two saved scripts:

```json
[
  {
    "id": "start",
    "name": "Start App",
    "command": "npm start",
    "icon": "play",
    "runOnWorktreeCreate": true,
    "async": true,
    "previewUrl": "http://127.0.0.1:8766",
    "autoOpenPreview": true
  },
  {
    "id": "vrm",
    "name": "Export VRM",
    "command": "\"C:\\Program Files\\Blender Foundation\\Blender 5.2\\blender.exe\" -b assets/donor/weighted-body.blend --python-exit-code 1 --python blender-out/make-vrm.py -- --out exports/avatar.vrm --blend exports/avatar.blend",
    "icon": "build",
    "runOnWorktreeCreate": false
  }
]
```

## VRM export notes

`scripts/mtoon-export.py` from the kit refuses to run until a spring-bone plan is
registered with `scripts/spring-setup.py`, so a bare body export does not go through it.
For a straight Blender export, write VRM metadata directly on the armature:

```python
ext = armature.data.vrm_addon_extension
ext.vrm0.meta.vrm_name = "..."   # VRM 0.x mirror
ext.vrm1.meta.vrm_name = "..."   # VRM 1.0 metadata used by the exporter
bpy.ops.vrm.assign_vrm0_humanoid_human_bones_automatically(armature_object_name=armature.name)
bpy.ops.vrm.assign_vrm1_humanoid_human_bones_automatically(armature_object_name=armature.name)
bpy.ops.export_scene.vrm(filepath="...", armature_object_name=armature.name, ignore_warning=True)
```

Without those meta writes the export still succeeds but carries `"authors": ["undefined"]`.

## Applying this profile

```sh
project=/absolute/path/to/charakuru
mkdir -p "$project/.pi"
cp -n pi-profiles/charakuru/settings.json "$project/.pi/settings.json"
```

Do not overwrite an existing project settings file; merge it by hand instead.

## Licensing

The kit is source-available, not open source. Do not redistribute the kit, vendor its code
into a published product, or extract its bundled assets. Read `LICENSE` and
`docs/license.ja.md` in the kit before any commercial use.
