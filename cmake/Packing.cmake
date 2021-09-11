set(CPACK_PACKAGE_NAME ${PROJECT_NAME})
set(CPACK_PACKAGE_VENDOR "Some Company")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Simple C++ application")
set(CPACK_PACKAGE_INSTALL_DIRECTORY ${CPACK_PACKAGE_NAME})
SET(CPACK_OUTPUT_FILE_PREFIX "${CMAKE_SOURCE_DIR}/packages")
set(CPACK_PACKAGING_INSTALL_PREFIX "/opt/some/${CMAKE_PROJECT_VERSION}")
set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})
set(CPACK_VERBATIM_VARIABLES YES)

set(CPACK_PACKAGE_CONTACT "YOUR@E-MAIL.net")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "YOUR NAME")
#set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS ON)

set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/LICENSE")
set(CPACK_RESOURCE_FILE_README "${CMAKE_CURRENT_SOURCE_DIR}/README.md")

# package name for deb
# if set, then instead of SomeLibrary-0.9.1-Darwin.deb
# you'll get somelibrary_0.9.1_darwin-amd64.deb
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
# if you want every group to have its own package,
# although the same happens if this is not sent (so it defaults to ONE_PER_GROUP)
# and CPACK_DEB_COMPONENT_INSTALL is ON
set(CPACK_COMPONENTS_GROUPING ALL_COMPONENTS_IN_ONE)#ONE_PER_GROUP)
# without this you won't be able to pack only specified component
set(CPACK_DEB_COMPONENT_INSTALL ON)

include(CPack)

# optionally, you can add various meta information to the components defined in INSTALLs
# cpack_add_component(programMain
#     DISPLAY_NAME "Some application"
#     DESCRIPTION "${CPACK_PACKAGE_DESCRIPTION_SUMMARY}"
#     #GROUP group1
# )
# cpack_add_component(libSome
#     DISPLAY_NAME "Some library"
#     DESCRIPTION "${CPACK_PACKAGE_DESCRIPTION_SUMMARY}"
#     #GROUP group1
# )
# cpack_add_component(libAnother
#     DISPLAY_NAME "Another library"
#     DESCRIPTION "${CPACK_PACKAGE_DESCRIPTION_SUMMARY}"
#     #GROUP group2
# )
# you can also put them into groups
#cpack_add_component_group(group1)
#cpack_add_component_group(group2)

# can be also set as -DCPACK_COMPONENTS_ALL="AnotherLibrary"
#set(CPACK_COMPONENTS_ALL "AnotherLibrary")
message(STATUS "Components to pack: ${CPACK_COMPONENTS_ALL}")
