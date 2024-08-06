rule run_naps:
    input:
        sleap_output="{project}/{output_dir}/{video_name}_sleap_results.slp",
        original_video=lambda wildcards: f"{config['project_configs'][wildcards.project]['videos']['input_dir']}/{wildcards.video_name}",
    output:
        naps_output="{project}/{output_dir}/{video_name}_naps_results.slp",
    params:
        options=lambda wildcards: " ".join(
            f"{key} {value}"
            for key, value in config["project_configs"][wildcards.project]["naps_options"].items()
        ),
        output_dir=lambda wildcards: config["project_configs"][wildcards.project]["output_dir"],
        naps_output_no_ext=lambda wildcards: f"{wildcards.project}/{wildcards.output_dir}/{wildcards.video_name}_naps_results",
    conda:
        "../envs/naps.yml"
    container:
        "docker://swwolf/naps:latest"
    shell:
        """
        naps-track --slp-path "{input.sleap_output}" \
        --video-path "{input.original_video}" \
        {params.options} \
        --output "{params.naps_output_no_ext}"
        """
