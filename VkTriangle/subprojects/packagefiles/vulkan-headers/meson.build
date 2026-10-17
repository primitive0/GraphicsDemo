project(
  'VulkanHeaders',
  'cpp',
  version: '1.4.363',
  meson_version: '>=1.3.0',
)

vulkan_headers_dep = declare_dependency(
  include_directories: include_directories('include'),
  version: meson.project_version(),
)
meson.override_dependency('vulkan-headers', vulkan_headers_dep)
