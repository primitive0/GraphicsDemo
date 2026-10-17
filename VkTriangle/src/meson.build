glfw3_dep = dependency('glfw3', version: '3.4')
vulkan_headers_dep = dependency('vulkan-headers', version: '1.4.363')
vk_bootstrap_dep = dependency('vk-bootstrap', version: '1.4.363')

executable(
  'VkTriangle',
  'main.cpp',
  dependencies: [glfw3_dep, vulkan_headers_dep, vk_bootstrap_dep],
)
