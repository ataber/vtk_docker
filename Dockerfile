FROM ataber/trilinos

RUN cd /tmp && \
    wget -nv -O- http://www.vtk.org/files/release/8.1/VTK-8.1.1.tar.gz | \
    tar xz && \
    cd VTK-8.1.1 && \
    cmake \
    -D CMAKE_BUILD_TYPE:STRING=Release \
    -D CMAKE_INSTALL_PREFIX:STRING=/usr \
    -D BUILD_DOCUMENTATION:BOOL=OFF \
    -D BUILD_EXAMPLES:BOOL=OFF \
    -D BUILD_TESTING:BOOL=OFF \
    -D BUILD_SHARED_LIBS:BOOL=ON \
    -D VTK_USE_X:BOOL=OFF \
    -D VTK_OPENGL_HAS_OSMESA:BOOL=OFF \
    -D OPENGL_INCLUDE_DIR=/usr/include/ \
    -D VTK_RENDERING_BACKEND:STRING=OpenGL \
    -D VTK_Group_MPI:BOOL=OFF \
    -D VTK_Group_StandAlone:BOOL=OFF \
    -D VTK_Group_Rendering:BOOL=OFF \
    -D VTK_WRAP_PYTHON=OFF \
    . && \
    make -j $(cat /proc/cpuinfo | grep processor | wc -l) && \
    make install && \
    cd .. && rm -rf VTK-8.1.1
