rule compute_metrics:
    input:
        sleap_model_path=lambda wildcards: config["project_configs"][wildcards.project][
            "model_configs"
        ][wildcards.model],
    output:
        sleap_qc_plot_path="{project}/{output_dir}/sleap_model_metrics/{model}_sleap_model_metrics.png",
    conda:
        "../envs/sleap.yml"
    container:
        "docker://swwolf/sleap:latest"
    script:
        "../scripts/sleap_model_qc.py"
