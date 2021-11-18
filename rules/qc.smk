"""
This will build the QC report

The inputs are:
    - the pipeline config file
    - IRMA assembly count table
    - IRMA coverage file directory
  
The outputs are:
    - a QC report html file
"""

configfile: "config.yaml"

rule QC_all:
    input:
        expand("{sample}_QC_report.html", sample=config["samples"])

rule make_QC_report:
    message:
        """
        ** report **
        Making the report in R
        """
    input:
       config_file = "config.yaml",
       run_IRMA = "02_irma_assembly/{sample}/IRMA_COMPLETE",
       rmarkdown = config["program_dir"] + "qc/scripts/markdown_qc.Rmd",
    params:
       IRMA_table = "02_irma_assembly/{sample}/irma_output/tables/READ_COUNTS.txt",
       IRMA_dir = "02_irma_assembly/{sample}/irma_output/tables/",
    output:
       report = "{sample}_QC_report.html"
    shell:
        """
        Rscript {config[program_dir]}qc/scripts/run_QC_markdown.R \
            --config_file {input.config_file} \
            --IRMA_table {params.IRMA_table} \
            --IRMA_dir {params.IRMA_dir} \
            --output_dir . \
            --rmarkdown {input.rmarkdown} \
            --output {output.report}
        """