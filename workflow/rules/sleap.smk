
rule run_sleap:
    input:
        video=lambda wildcards: f"{config['project_configs'][wildcards.project]['videos']['input_dir']}/{wildcards.video_name}",
    output:
        sleap_output="{base_output_dir}/{project}/{video_name}_sleap_results.slp",
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
        input_dir=lambda wildcards: config["project_configs"][wildcards.project]["videos"][
            "input_dir"
        ],
    conda:
        "../envs/sleap.yml"
    container:
        "docker://swwolf/sleap:latest"
    shell:
        """
        module load cuda && module load cudnn &&
        sleap-track "{input.video}" \
        --output "{output.sleap_output}" \
        --verbosity json \
        -m "{params.centroid_model}" \
        -m "{params.instance_model}" \
        {params.options}
        """
