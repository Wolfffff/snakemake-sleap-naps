import os

import matplotlib as mpl
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns
import sleap

# Snakemake input and output
# type: ignore  # Path to the folder with model metrics
model_path = snakemake.input.sleap_model_path  # type: ignore[name-defined]
# Path to save the output image
output_image_path = snakemake.output.sleap_qc_plot_path  # type: ignore[name-defined]
# Set the plotting style
mpl.style.use("seaborn-v0_8-deep")

# Load metrics
metrics = sleap.load_metrics(model_path, split="val")

# Load the labels to get node names -- there's probably a better way to do this
# I tried skeleton.Skeleton.load_all_hdf5 but it didn't work easily
labels = sleap.load_file(os.path.join(model_path, "labels_gt.val.slp"))
node_names = labels.skeleton.node_names

# Filter the DataFrame to include only the node names
dists = pd.DataFrame(metrics["dist.dists"], columns=node_names).melt(
    var_name="Part", value_name="Error"
)

# Convert 'Part' column to a categorical type with the order defined by the node names
dists["Part"] = pd.Categorical(dists["Part"], categories=node_names, ordered=True)

# Create the plot
fig, ax = plt.subplots(figsize=(8.5, 4.5), dpi=600)
sns.boxplot(data=dists, x="Error", y="Part", fliersize=0, color="#ECCBAE", ax=ax)
sns.stripplot(
    data=dists,
    x="Error",
    y="Part",
    alpha=0.5,
    linewidth=0,
    size=2,
    jitter=0.1,
    color="#046C9A",
    ax=ax,
)

# Set plot titles and labels
ax.set_title("Worker Model Validation Localization Error (Ground Truth vs Prediction)")
dist_1d = metrics["dist.dists"].flatten()
xmax = np.ceil(np.ceil(np.nanpercentile(dist_1d, 95) / 5) + 1) * 5
ax.set_ylabel("")
ax.set_xlabel("Error (px)")
plt.tight_layout()

# Save the plot
fig.savefig(output_image_path, dpi=600)
