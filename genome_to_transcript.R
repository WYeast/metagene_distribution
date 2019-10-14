library(ensembldb)
library(EnsDb.Hsapiens.v86)
names=c("merip.1","merip.2")

for (s in names){
	sample=paste(s,".midpoint_for_processing.txt",sep="")
    data=read.table(sample, header=F)
    chr=data[,1]
    pos=data[,2]
    gr=GRanges(seqnames=chr,ranges=pos)
    edbx=EnsDb.Hsapiens.v86
    gr_tx=genomeToTranscript(gr, edbx)
    output_file=paste(s,"_ENST.txt",sep="")
    write.table(gr_tx,output_file)
}


    
