rule run_sleap_tracking:
    input:
        sleap_output="{base_output_dir}/{project}/{video_name}_sleap_results.slp",
    output:
        tracked_output="{base_output_dir}/{project}/{video_name}_sleap_results_tracked.slp"
    params:
        options=lambda wildcards: " ".join(
            f"{key} {value}"
            for key, value in config["project_configs"][wildcards.project]["sleap_tracking_options"].items()
        ),
    container:
        "docker://swwolf/sleap:latest"
    shell:
        """
        sleap-track {input.sleap_output} {params.options} -o {output.tracked_output}
        """