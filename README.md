# AIV Pipeline QC Module
---

Quality control module for ensuring that we report accurate results.

Input:
* Statistics from the preprocessing module.
    * Is the raw data good enough quality? How many reads were removed?
* Statistics from the IRMA assembly module.
    * Was there enough reads / depth to confidently assemble a genome?
    * Was there any sign of a 'mixed' infection (relatively common)? Were there any ambiguous assembly positions?
    * Were the segment ends completely recovered?
* Statistics from the phylogenetics module.
    * Does the new sequence make sense in the tree? I.e., is it a huge branch or does it fit with the current evolutionary rates.

Output:
* Tables / graphs of raw read trimming results, assembly and phylogenetic results.
* Graphs of the read depth / coverage over each segment.
* Maybe a html report for laboratory staff to conveniently check if the data are suitable for reporting.
* Could include a table with ticks / crosses for each metric.