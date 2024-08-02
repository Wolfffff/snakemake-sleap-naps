
rule run_sleap:
    input:
        video=lambda wildcards: [
            video for ext in config["project_configs"][wildcards.project]["videos"]["file_extensions"]
            for video in glob.glob(
                os.path.join(
                    config["project_configs"][wildcards.project]["videos"]["input_dir"],
                    f"{wildcards.video_name}.{ext}"
                )
            )
        ]
    output:
        sleap_output="{project}/{output_dir}/{video_name}_{ext}_sleap_results.slp"
    params:
        options=lambda wildcards: " ".join(
            f"{key} {value}"
            for key, value in config["project_configs"][wildcards.project]["sleap_options"].items()
        ),
        centroid_model=lambda wildcards: config["project_configs"][wildcards.project]["model_configs"]["centroid_model"],
        instance_model=lambda wildcards: config["project_configs"][wildcards.project]["model_configs"]["centered_instance_model"],
        output_dir=lambda wildcards: config["project_configs"][wildcards.project]["output_dir"],
        input_dir=lambda wildcards: config["project_configs"][wildcards.project]["videos"]["input_dir"],
    conda:
        "../envs/sleap.yml"
    shell:
        """
        sleap-track "{input.video}" \
        --output "{output.sleap_output}" \
        -m "{params.centroid_model}" \
        -m "{params.instance_model}" \
        {params.options}
        """
