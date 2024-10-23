rule sleap_convert:
    input:
        naps_output="{base_output_dir}/{project}/{video_name}_naps_results.slp"
    output:
        analysis_output="{base_output_dir}/{project}/{video_name}_naps_results.analysis.h5"
    conda:
        "../envs/sleap.yml"
    container:
        "docker://swwolf/sleap:latest"
    shell:
        """
        sleap-convert "{input.naps_output}" -o "{output.analysis_output}" --format analysis
        """