# these are cache variables, so they could be overwritten with -D,
set(
    CPACK_PACKAGE_NAME ${PROJECT_NAME}
    CACHE STRING "The resulting package name"
)
# which is useful in case of packing only selected components instead of the whole thing
set(
    CPACK_PACKAGE_DESCRIPTION_SUMMARY "Simple C++ application"
    CACHE STRING "Package description for the package metadata"
)
set(CPACK_PACKAGE_VENDOR "Some Company")

set(CPACK_VERBATIM_VARIABLES YES)

set(CPACK_PACKAGE_INSTALL_DIRECTORY ${CPACK_PACKAGE_NAME})
SET(CPACK_OUTPUT_FILE_PREFIX "${CMAKE_SOURCE_DIR}/_packages")
set(CPACK_STRIP_FILES YES)

set(
    CPACK_INSTALL_DEFAULT_DIRECTORY_PERMISSIONS
    OWNER_READ OWNER_WRITE OWNER_EXECUTE
    GROUP_READ GROUP_EXECUTE
    WORLD_READ WORLD_EXECUTE
)

set(CPACK_PACKAGING_INSTALL_PREFIX "/opt/some")#/${CMAKE_PROJECT_VERSION}")

set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})

set(CPACK_PACKAGE_CONTACT "YOUR@E-MAIL.net")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "YOUR NAME <${CPACK_PACKAGE_CONTACT}>")

set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/LICENSE")
set(CPACK_RESOURCE_FILE_README "${CMAKE_CURRENT_SOURCE_DIR}/README.md")

# package name for deb. If set, then instead of some-application-0.9.2-Linux.deb
# you'll get some-application_0.9.2_amd64.deb (note the underscores too)
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
# that is if you want every group to have its own package,
# although the same will happen if this is not set (so it defaults to ONE_PER_GROUP)
# and CPACK_DEB_COMPONENT_INSTALL is set to YES
set(CPACK_COMPONENTS_GROUPING ALL_COMPONENTS_IN_ONE)#ONE_PER_GROUP)
# without this you won't be able to pack only specified component
set(CPACK_DEB_COMPONENT_INSTALL YES)
# list dependencies
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS YES)

include(CPack)

# optionally, you can add various meta information to the components defined in INSTALLs
# cpack_add_component(some-application
#     DISPLAY_NAME "Some application"
#     DESCRIPTION "${CPACK_PACKAGE_DESCRIPTION_SUMMARY}"
#     #GROUP group1
# )
# cpack_add_component(SomeLibrary
#     DISPLAY_NAME "Some library"
#     DESCRIPTION "${CPACK_PACKAGE_DESCRIPTION_SUMMARY}"
#     #GROUP group1
# )
# cpack_add_component(AnotherLibrary
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
