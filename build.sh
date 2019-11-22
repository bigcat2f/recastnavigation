####################################
echo "building recastnavigation"
if [ -d "build" ]; then
  cd build
  make -j8
else
  mkdir build && cd build
  cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=release -DRECASTNAVIGATION_STATIC=ON -DRECASTNAVIGATION_DEMO=OFF -DRECASTNAVIGATION_TESTS=OFF -DRECASTNAVIGATION_EXAMPLES=OFF ../
  make -j8
fi


function copyLib()
{
  libname=$1
  cd ../$libname
  if [ -d "lib" ]; then
    rm -rf lib
  fi
  mkdir lib
  cp ../build/$libname/lib$libname.a ./lib/
}

copyLib Detour
copyLib DetourTileCache
copyLib Recast

cd ../
####################################
echo "build recastnavigation finished"
