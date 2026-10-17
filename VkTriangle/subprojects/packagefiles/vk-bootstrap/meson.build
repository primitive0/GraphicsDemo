project(
  'vk-bootstrap',
  'cpp',
  version: '1.4.363',
  meson_version: '>=1.3.0',
  default_options: {'cpp_std': 'c++17'},
)

vulkan_headers_dep = dependency('vulkan-headers')

vk_bootstrap_lib = static_library(
  'vk-bootstrap',
  'src/VkBootstrap.cpp',
  dependencies: [vulkan_headers_dep],
)
vk_bootstrap_dep = declare_dependency(
  link_with: vk_bootstrap_lib,
  include_directories: include_directories('src'),
  dependencies: [vulkan_headers_dep],
)
meson.override_dependency('vk-bootstrap', vk_bootstrap_dep)
