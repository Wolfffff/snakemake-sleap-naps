rule run_naps:
    input:
        sleap_output="{project}/{output_dir}/{video_name}_sleap_results.slp",
        original_video=lambda wildcards: f"{config['project_configs'][wildcards.project]['videos']['input_dir']}/{wildcards.video_name}",
    output:
        naps_output="{project}/{output_dir}/{video_name}_naps_results.h5",
    params:
        options=lambda wildcards: " ".join(
            f"{key} {value}"
            for key, value in config["project_configs"][wildcards.project][
                "naps_options"
            ].items()
        ),
        output_dir=lambda wildcards: config["project_configs"][wildcards.project][
            "output_dir"
        ],
    conda:
        "../envs/naps.yml"
    shell:
        """
        naps-track "{input.sleap_output}" \
        --output "{output.naps_output}" \
        {params.options}
        """
