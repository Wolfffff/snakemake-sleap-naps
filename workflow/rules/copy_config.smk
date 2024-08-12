import shutil


rule copy_config:
    input:
        config_file="config/config.yaml",
    output:
        config_copy=expand(
            "{base_output_dir}/{project}/{output_dir}/config.yaml",
            base_output_dir=config["run_config"]["base_output_dir"],
            project=config["project_configs"].keys(),
            output_dir=[
                config["project_configs"][project]["output_dir"]
                for project in config["project_configs"].keys()
            ],
        ),
    run:
        for output_path in output.config_copy:
            shutil.copy(input.config_file, output_path)
