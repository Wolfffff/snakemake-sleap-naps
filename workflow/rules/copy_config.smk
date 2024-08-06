rule copy_config:
    input:
        config_file="config/config.yaml",
    output:
        config_copy=expand(
            "{project}/{output_dir}/config.yaml",
            project=config["project_configs"].keys(),
            output_dir=[
                config["project_configs"][project]["output_dir"]
                for project in config["project_configs"].keys()
            ],
        ),
    run:
        for output_path in output.config_copy:
            shell(f"cp {input.config_file} {output_path}")
