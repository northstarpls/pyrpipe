#!/bin/bash 

# install dependencies
#install samtools
wget https://github.com/samtools/samtools/releases/download/1.10/samtools-1.10.tar.bz2 -O /tmp/samtools.tar.bz2
tar -xvjf /tmp/samtools.tar.bz2
cd samtools-1.10
./configure --prefix=$(pwd)
make && make install
cd ..
export PATH=$PWD/samtools-1.10/bin/:$PATH
#install mikado
pip install Cython
pip install mikado
#install sratoolkit
wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.9.6-1/sratoolkit.2.9.6-1-ubuntu64.tar.gz -O /tmp/sratools.tar.gz
tar -xvzf /tmp/sratools.tar.gz
export PATH=$PWD/sratoolkit.2.9.6-1-ubuntu64/bin/:$PATH
#install stringtie
wget http://ccb.jhu.edu/software/stringtie/dl/stringtie-2.0.6.Linux_x86_64.tar.gz -O /tmp/stie.tar.gz
tar -xvzf /tmp/stie.tar.gz
export PATH=$PWD/stringtie-2.0.6.Linux_x86_64/:$PATH
#install cufflinks
wget http://cole-trapnell-lab.github.io/cufflinks/assets/downloads/cufflinks-2.2.1.Linux_x86_64.tar.gz -O /tmp/cuff.tar.gz
tar -xvzf /tmp/cuff.tar.gz
export PATH=$PWD/cufflinks-2.2.1.Linux_x86_64/:$PATH
#install Trinity
wget https://github.com/trinityrnaseq/trinityrnaseq/releases/download/v2.9.0/trinityrnaseq-v2.9.0.FULL.tar.gz -O /tmp/trin.tar.gz
tar -xvzf /tmp/trin.tar.gz
cd trinityrnaseq-v2.9.0
make
export TRINITY_HOME=$(pwd)
cd ..
export PATH=$PWD/trinityrnaseq-v2.9.0:$PATH
#install jellyfish
wget https://github.com/gmarcais/Jellyfish/releases/download/v2.3.0/jellyfish-2.3.0.tar.gz -O /tmp/jfish.tar.gz
tar -xvzf /tmp/jfish.tar.gz
cd jellyfish-2.3.0
./configure --prefix=$(pwd)
make && make install
export PATH=$PWD/bin:$PATH
cd ..  
#install hisat2
wget ftp://ftp.ccb.jhu.edu/pub/infphilo/hisat2/downloads/hisat2-2.1.0-Linux_x86_64.zip -O /tmp/hisat2.zip
unzip /tmp/hisat2.zip
export PATH=$PWD/hisat2-2.1.0/:$PATH
#install STAR
wget https://github.com/alexdobin/STAR/archive/2.7.3a.tar.gz -O /tmp/star.tar.gz
tar -xvzf /tmp/star.tar.gz
export PATH=$PWD/STAR-2.7.3a/bin/Linux_x86_64/:$PATH
#install bowtie2
wget https://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.3.5.1/bowtie2-2.3.5.1-linux-x86_64.zip/download -O /tmp/btie.zip
unzip /tmp/btie.zip
export PATH=$PWD/bowtie2-2.3.5.1-linux-x86_64/:$PATH
#install kallisto
wget https://github.com/pachterlab/kallisto/releases/download/v0.46.1/kallisto_linux-v0.46.1.tar.gz -O /tmp/kallisto.tar.gz
tar -xvzf /tmp/kallisto.tar.gz
export PATH=$PWD/kallisto/:$PATH
#install salmon
wget https://github.com/COMBINE-lab/salmon/releases/download/v1.1.0/salmon-1.1.0_linux_x86_64.tar.gz -O /tmp/salmon.tar.gz
tar -xvzf /tmp/salmon.tar.gz
export PATH=$PWD/salmon-latest_linux_x86_64/bin/:$PATH
#install cutadapt
pip3 install --upgrade cutadapt
#install trim_galore
wget https://github.com/FelixKrueger/TrimGalore/archive/0.6.5.tar.gz -O /tmp/tg.tar.gz
tar -xvzf /tmp/tg.tar.gz
export PATH=$PWD/TrimGalore-0.6.5/:$PATH
#install bbduk
wget https://sourceforge.net/projects/bbmap/files/BBMap_38.73.tar.gz/download -O /tmp/bbtools.tar.gz
tar -xvzf /tmp/bbtools.tar.gz
export PATH=$PWD/bbmap/:$PATH
  
  
