
rule run_sleap:
    input:
        video=lambda wildcards: f"{config['project_configs'][wildcards.project]['videos']['input_dir']}/{wildcards.video_name}",
    output:
        sleap_output="{base_output_dir}/{project}/{output_dir}/{video_name}_sleap_results.slp",
    params:
        options=lambda wildcards: " ".join(
            f"{key} {value}"
            for key, value in config["project_configs"][wildcards.project]["sleap_options"].items()
        ),
        centroid_model=lambda wildcards: config["project_configs"][wildcards.project][
            "model_configs"
        ]["centroid_model"],
        instance_model=lambda wildcards: config["project_configs"][wildcards.project][
            "model_configs"
        ]["centered_instance_model"],
        output_dir=lambda wildcards: config["project_configs"][wildcards.project]["output_dir"],
        input_dir=lambda wildcards: config["project_configs"][wildcards.project]["videos"][
            "input_dir"
        ],
    conda:
        "../envs/sleap.yml"
    container:
        "docker://swwolf/sleap:latest"
    shell:
        """
        sleap-track "{input.video}" \
        --output "{output.sleap_output}" \
        -m "{params.centroid_model}" \
        -m "{params.instance_model}" \
        {params.options}
        """
