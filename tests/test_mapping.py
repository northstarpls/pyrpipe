#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Dec 26 23:32:09 2019

@author: usingh
"""

from pyrpipe import mapping
from pyrpipe import pyrpipe_utils as pu
from testingEnvironment import testSpecs
import os

testVars=testSpecs()

def test_mapping():
    #create assemble object
    mob=mapping.Aligner()
    assert mob.category == "Aligner","Failed Mapping init"
    

def test_hisat2():
    #test hisat build and hisat mapping
    hs=mapping.Hisat2()
    assert hs.check_index()==False, "Failed hisat check_index"
    #build index
    st=hs.build_index(testVars.testDir,"hisatindex",testVars.genome)
    assert st==True, "Failed to build hisat2 index"
    #perform alignment without sraobject
    hsMapOpts={"-1":testVars.fq1,"-2":testVars.fq2,"-S":testVars.testDir+"/hisatTest.sam","--dta-cufflinks":"","-p":"10","-x":hs.hisat2_index}
    st=hs.run_hisat2(**hsMapOpts)
    assert st==True, "Failed to run hisat"


def test_star():
    star=mapping.Star(index="",threads=2)
    assert star.check_index()==False, "Failed star check_index"
    #build index
    st=star.build_index(testVars.testDir+"/starIndex",testVars.genome)
    assert st==True, "Failed to build star index"
    #perform alignment without sraobject
    #create outdir
    outdir=os.path.join(testVars.testDir,"starout")
    if not os.path.isdir(outdir):
        os.mkdir(outdir)
    opts={"--outFilterType":"BySJout",
            "--runThreadN":"8",
            "--outSAMtype": "BAM SortedByCoordinate",
            "--outFileNamePrefix":outdir+"/",
            "--genomeDir":star.star_index,
            "--readFilesIn":testVars.fq1+" "+testVars.fq2
            }
    st=star.run_star(**opts)
    assert st==True, "Failed to run star"



def test_bowtie():
    bt=mapping.Bowtie2(index="")
    assert bt.check_index()==False, "Failed bowtie2 check_index"
    st=bt.build_index(testVars.testDir+"/btIndex","bowtieIndex",testVars.genome)
    assert st==True, "Failed to build bowtie2 index"
    opts={"-1":testVars.fq1,"-2":testVars.fq2,"-S":testVars.testDir+"/bowtie2.sam","-x":bt.bowtie2_index}
    st=bt.run_bowtie2(**opts)
    assert st==True, "Failed to run bowtie2"

