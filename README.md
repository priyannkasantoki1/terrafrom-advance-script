
# Terraform Graph Visualization

This guide explains how to install **Graphviz**, generate a Terraform graph, and view it.

## 1. Install Graphviz
Use the following command to install Graphviz on Red Hat-based systems:

```bash
sudo yum install graphviz -y
```
## 2. Generate Terraform Graph
Run the following command to generate a Terraform graph in PNG format

```bash
terraform graph -type=plan | dot -Tpng > graph.png
```
## 3. View the Graph

```bash
firefox graph.png 
```

## 4. second methods
Run the following command to generate a Terraform graph in PNG format

```bash
terraform graph >graph.dot
dot -Tpng > graph.png
```

## Authors

- [@priyannka-santoki](https://www.github.com/priyannkasantoki1/)
