#!/bin/sh

XnViewMP_dir=/opt/XnViewMP
export LD_LIBRARY_PATH=${XnViewMP_dir}
exec ${XnViewMP_dir}/xnview "$@"
