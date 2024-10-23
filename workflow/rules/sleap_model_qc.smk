rule compute_metrics:
    input:
        sleap_model_path=lambda wildcards: config["project_configs"][wildcards.project][
            "model_configs"
        ][wildcards.model],
    output:
        sleap_qc_plot_path="{base_output_dir}/{project}/sleap_model_metrics/{model}_sleap_model_metrics.png",
    conda:
        "../envs/naps.yml"
    container:
        "docker://swwolf/naps:latest"
    script:
        "../scripts/sleap_model_qc.py"
