###
###

.pkgname <- "BSgenome.Drerio.blaserlabgenotyping.dr11"

.seqnames <- as.character(1:25)

.circ_seqs <- character(0)

.mseqnames <- NULL

.onLoad <- function(libname, pkgname)
{
    if (pkgname != .pkgname)
        stop("package name (", pkgname, ") is not ",
             "the expected name (", .pkgname, ")")
    extdata_dirpath <- system.file("extdata", package=pkgname,
                                   lib.loc=libname, mustWork=TRUE)

    ## Make and export BSgenome object.
    bsgenome <- BSgenome(
        organism="Danio rerio",
        common_name="zebrafish",
        genome="GRCz11",
        provider="blaserlab",
        release_date="12 Oct 2021",
        source_url="http://ftp.ensembl.org/pub/release-105/fasta/danio_rerio/dna/",
        seqnames=.seqnames,
        circ_seqs=.circ_seqs,
        mseqnames=.mseqnames,
        seqs_pkgname=pkgname,
        seqs_dirpath=extdata_dirpath
    )

    ns <- asNamespace(pkgname)

    objname <- pkgname
    assign(objname, bsgenome, envir=ns)
    namespaceExport(ns, objname)

    old_objname <- "Drerio"
    assign(old_objname, bsgenome, envir=ns)
    namespaceExport(ns, old_objname)
}

