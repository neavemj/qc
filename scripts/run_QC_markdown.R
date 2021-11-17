
library(rmarkdown)
library(optparse)

# use optparse to grab command line arguments for the report

option_list <- list(
  # required args
  make_option(c("--config_file"), type="character", default=NULL,
              help="Config file used to run the pipeline", metavar="character"),
              
  make_option(c("--IRMA_table"), type="character", default=NULL,
              help="Counts table produced by IRMA READ_COUNTS.txt", metavar="character"),

  make_option(c("--IRMA_dir"), type="character", default=NULL,
              help="Directory where IRMA puts the coverage files", metavar="character"),
                           
  make_option(c("--output"), type="character", default=NULL,
              help="name and file path for html QC report", metavar="character"),

  make_option(c("--output_dir"), type="character", default=NULL,
              help="directory to put html file. Otherwise rmarkdown puts
              the output in the same directory as the markdown document", metavar="character"),
             
  make_option(c("--rmarkdown"), type="character", default=NULL,
              help="location of rmarkdown file", metavar="character")
)


opt_parser <- OptionParser(option_list=option_list)
opt <- parse_args(opt_parser)

# need to grab the working project directory here
# otherwise rmarkdown uses the directory where the markdown document
# is located as the working directory. 

working_dir <- getwd()

# now read data for making the report

render(opt$rmarkdown,
    params = list(
    config_file = opt$config_file,
    IRMA_table = opt$IRMA_table,
    IRMA_dir = opt$IRMA_dir
    ),
    output_file = opt$output,
    output_dir = opt$output_dir)

