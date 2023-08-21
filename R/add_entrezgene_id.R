options(download.method = "wget")

# DEG analysis annotation file
if (file.exists("/tmp/annotation.Rdata")){
  
  cat("annotation file already exists!")
  
}else{
  
  ## set up connection to ensembl database
  ensembl=useMart(host = "https://www.ensembl.org",
                  biomart = "ENSEMBL_MART_ENSEMBL",
                  dataset = "mmulatta_gene_ensembl")
  
  # run the query
  attributeNames <- c('ensembl_gene_id', 'external_gene_name', 'description')
  
  annot <- getBM(attributes=attributeNames, mart = ensembl)
  
  save(annot,file="/tmp/annotation.Rdata")
}

# KEGG analysis annotation file
if (file.exists("/tmp/entrezgene.Rdata")){
  
  cat("entrezgene file already exists!")
  
}else{
  
  ## set up connection to ensembl database
  ensembl=useMart(host = "ensembl.org",
                  biomart = "ENSEMBL_MART_ENSEMBL",
                  dataset = "mmulatta_gene_ensembl")
  
  # run the query
  attributeNames <- c('ensembl_gene_id', "entrezgene_id")
  
  entrezgene <- getBM(attributes=attributeNames,mart = ensembl)
  entrezgene <- dplyr::rename(entrezgene, Gene_stable_ID = ensembl_gene_id)
  save(entrezgene,file="/tmp/entrezgene.Rdata")
}