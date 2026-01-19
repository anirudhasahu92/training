#!/usr/bin/env nextflow

/*
 * Use echo to print 'Hello World!' to a file
 */
process sayHello {

    publishDir "results_params", mode: "copy"

    input:
        val greeting

    output:
        path 'output_params.txt'

    script:
    """
    echo '$greeting' > output_params.txt
    """
}

params.greeting = 'Hello from default params variable'

workflow {

    // emit a greeting
    sayHello(params.greeting) // any name can be used other than greeting as well
}
