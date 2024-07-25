# Spotify Playlist Creation with Terraform

This repository demonstrates how to use Terraform to create a Spotify playlist. Terraform is a powerful Infrastructure as Code (IaC) tool by HashiCorp that allows you to define and provision infrastructure using a declarative configuration language.

## Prerequisites

Before you start, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html)
- [Spotify Developer Account](https://developer.spotify.com/dashboard/)
- Spotify API credentials (Client ID and Client Secret)

## Getting Started

1. **Clone the Repository**

    ```bash
    git clone https://github.com/shittuay/spotify.git
    cd spotify
    ```

2. **Configure Spotify API Credentials**

    You need to set up your Spotify API credentials in a `.env` file. Create a `.env` file in the root directory and add your Spotify Client ID and Client Secret:

    ```plaintext
    SPOTIFY_CLIENT_ID=your_spotify_client_id
    SPOTIFY_CLIENT_SECRET=your_spotify_client_secret
    ```

3. **Initialize Terraform**

    Initialize the Terraform working directory, which will download the required providers and set up the backend:

    ```bash
    terraform init
    ```

4. **Review and Apply the Configuration**

    Before applying the configuration, you can review the execution plan:

    ```bash
    terraform plan
    ```

    If everything looks good, apply the configuration to create the Spotify playlist:

    ```bash
    terraform apply
    ```

    You will be prompted to confirm the action. Type `yes` to proceed.

## Configuration

The main configuration file is `main.tf`. Here is a brief explanation of its contents:

- **Provider Configuration**: Configures the Spotify provider using the credentials from the `.env` file.

    ```hcl
    provider "spotify" {
      client_id     = var.spotify_client_id
      client_secret = var.spotify_client_secret
    }
    ```

- **Resource Definition**: Defines the Spotify playlist resource with the desired properties such as name and description.

    ```hcl
    resource "spotify_playlist" "example" {
      name        = "My Terraform Playlist"
      description = "A playlist created using Terraform"
      public      = true
    }
    ```

## Variables

Variables are used to manage sensitive information and configuration options. They are defined in the `variables.tf` file:

```hcl
variable "spotify_client_id" {
  description = "Spotify Client ID"
  type        = string
  sensitive   = true
}

variable "spotify_client_secret" {
  description = "Spotify Client Secret"
  type        = string
  sensitive   = true
}
```

## Output

After applying the configuration, you can view the playlist details in the Terraform output:

```hcl
output "playlist_id" {
  value = spotify_playlist.example.id
}
```

## Cleanup

To destroy the created resources, run:

```bash
terraform destroy
```

You will be prompted to confirm the action. Type `yes` to proceed.

## References

- [Terraform Documentation](https://www.terraform.io/docs/index.html)
- [Spotify Developer Documentation](https://developer.spotify.com/documentation/web-api/)

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Happy Terraforming! 🌱
