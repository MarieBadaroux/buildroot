#!/bin/bash

PARSEC_HOME="/work/marie/parsec-3.0"

# YOU MUST BUILD THE PARSEC BENCHMARKS FIRST
cd /work/marie/parsec-3.0
source env.sh
./parsec_build
cd -

mkdir bin

for bin in $(find ${PARSEC_HOME} -type f -executable | xargs file | grep RISC-V | awk -F: '{print $1}' | grep inst)
do
	cp ${bin} ./bin/
done

for dir in $(find ${PARSEC_HOME} -name input_sim\*.tar | sed -e "s+${PARSEC_HOME}/*++" | xargs dirname)
do
	cd ${PARSEC_HOME}/${dir}
	for size in small large
		do
			tar xf input_sim${size}.tar
		done
done

cd /work/marie/buildroot/package/parsec
