# Dgraph (Work-in-progress)

[<- Back](../README.md)

A Dgraph database deployed to AWS.

## TODO

- Choose deployment strategy.
- [Deploy via Kubernetes.](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs)

## Quickstart

```terraform
module "repo" {
  source = "git::github.com/wurde/terraform-modules//dgraph"
}
```

Initialize the Terraform config, plan changes, and apply.

```bash
terraform init
terraform plan
terraform apply
```

Visit the Ratel instance on `localhost:8000` for UI-based queries.

## Variables

`ebs_volume_size` - The size of the drive in GiBs. (Default: 2)

`ebs_volume_iops` - The amount of IOPS to provision for the disk. (Default: 3000)

`ebs_volume_throughput` - The throughput that the volume supports, in MiB/s. (Default: 125)

## Concepts

A Dgraph cluster consists of the following:

- Dgraph Alpha database server nodes:

      The Dgraph Alpha server nodes in your
      deployment host and serve data. These
      nodes also host an /admin HTTP and GRPC
      endpoint that can be used for data and
      node administration tasks such as
      backup, export, draining, and shutdown.

- Dgraph Zero management server nodes:

      The Dgraph Zero nodes in your deployment
      control the nodes in your Dgraph cluster.
      Dgraph Zero automatically moves data
      between different Dgraph Alpha instances
      based on the volume of data served by
      each Alpha instance.

You need at least one node of each type to run
Dgraph. You need three nodes of each type to
run Dgraph in a high-availability (HA) cluster
configuration.

See more in the [Dgraph documentation](https://dgraph.io/docs/deploy/overview).

## Production Reccomendations

Hardware:

    Dgraph instances usage is disk heavy. Choose storage
    with high IOPS (SSD not HDD). 1000 IOPS minimum.

Filesystem

    Choose Linux filesystem ext4.
    Avoid using shared storage (NFS, CEPH, etc).

File Descriptors

    Set to unlimited. If not possible, then to 1,048,576.
