# CMake CPack example

An example CMake project to demonstrate creating packages with CPack.

More details in the [following article](https://decovar.dev/blog/2021/09/23/cmake-cpack-package-deb-apt/).

## Some issues

As the time passed and I learned a bit more CMake, I realized that some things in these example projects are not entirely correct and could do with certain improvements. Neither affect the main topic of using CPack, so that is good, but still be aware of them just in case:

- libraries are hardcoded to `STATIC`, which is rarely a good idea. But at least it is somewhat understandable in case of Windows, because there are no DLL exports;
- there is no real need to split the installation module into `InstallingGeneral.cmake` and `InstallingConfigs.cmake`, it should be just one `Installing.cmake`;
- the "*generate the export targets for the build tree*" installation step is rather useless, so it probably should be removed;
- the `DESTINATION` for CMake configs should probably be `share/${PROJECT_NAME}` instead of `cmake`, although both work equally fine;
- every library subproject sets `DEBUG_POSTFIX`, while it should be set just once in the top-level project via `CMAKE_DEBUG_POSTFIX` (*but also explicitly for every executable*);
- the libraries targets namespace is set in every subproject. Instead it should be set just once in the top-level project;
- `CMAKE_MODULE_PATH` is set in every subproject. There is no need for that, it is enough to set it once in the top-level project;
- there should be no checks for top-level project and its variables, as libraries are already part of the project, and they shouldn't be meant to be built "separately" (*there is `--target` for that*).

Since the current setup builds and packs fine, I won't be fixing these issues, as that might affect the way example works, and I unfortunately don't have time to test that properly.
