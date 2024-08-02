rule run_naps:
    input:
        sleap_output="{project}/{output_dir}/{video_name}_sleap_results.slp",
        original_video=lambda wildcards: [
            video for ext in config["project_configs"][wildcards.project]["videos"]["file_extensions"]
            for video in glob.glob(
                os.path.join(
                    config["project_configs"][wildcards.project]["videos"]["input_dir"],
                    f"{wildcards.video_name}{ext}"
                )
            )
        ]
    output:
        naps_output="{project}/{output_dir}/{video_name}_naps_results.h5",
    params:
        options=lambda wildcards: " ".join(
            f"{key} {value}"
            for key, value in config["project_configs"][wildcards.project]["naps_options"].items()
        ),
        output_dir=lambda wildcards: config["project_configs"][wildcards.project]["output_dir"],
    conda:
        "../envs/naps.yml"
    shell:
        """
        naps-track "{input.sleap_output}" \
        --output "{output.naps_output}" \
        {params.options}
        """
