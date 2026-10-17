project(
  'VkTriangle',
  'cpp',
  version: '0.1.0',
  meson_version: '>=1.3.0',
  default_options: {'warning_level': '3', 'cpp_std': 'c++26'},
)

# Use these packages from Wrap, not system ones
subproject(
  'glfw',
  default_options: {'display-api': ['wayland']},
)
subproject('vulkan-headers')
subproject('vk-bootstrap')

subdir('src')
