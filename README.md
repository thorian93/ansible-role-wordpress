# Ansible Role: Wordpress

This role installs Wordpress on RHEL/CentOS, Debian/Ubuntu and Fedora servers.

[![Ansible Role: Wordpress](https://img.shields.io/ansible/role/ID?style=flat-square)](https://galaxy.ansible.com/thorian93/ansible_role_wordpress)
[![Ansible Role: Wordpress](https://img.shields.io/ansible/quality/ID?style=flat-square)](https://galaxy.ansible.com/thorian93/ansible_role_wordpress)
[![Ansible Role: Wordpress](https://img.shields.io/ansible/role/d/ID?style=flat-square)](https://galaxy.ansible.com/thorian93/ansible_role_wordpress)

## Known issues

None.

## Requirements

No special requirements; note that this role requires root access, so either run it in a playbook with a global `become: yes`, or invoke the role in your playbook like:

    - hosts: foobar
      roles:
        - role: ansible-role-wordpress
          become: yes

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

    wordpress_version: "5.6"

Define the Wordpress version you want to install.

    wordpress_external_url: "{{ inventory_hostname }}"

The external URL under which Wordpress will be available.

    wordpress_base_url: "https://wordpress.org"
    wordpress_download_url: "{{ wordpress_base_url }}/wordpress-{{ wordpress_version }}.tar.gz"


Download parameters for Wordpress. Should only be changed if you know what you are doing.

    wordpress_create_self_signed_cert: true
    wordpress_self_signed_cert_subj: "/C=DE/ST=NRW/L=Cologne/O=Org/CN={{ wordpress_external_url }}"
    wordpress_self_signed_certificate_key: "/etc/apache2/ssl/wordpress.key"
    wordpress_self_signed_certificate: "/etc/apache2/ssl/wordpress.crt"

Configure self signed certificates to your liking.

    wordpress_custom_cert: false
    wordpress_custom_cert_file: /etc/{{ apache2_http_name }}/ssl/wordpress.crt
    wordpress_custom_cert_key: /etc/{{ apache2_http_name }}/ssl/wordpress.key

If you want to use your own certificate you can define that here.

    wordpress_certificate_key: "{{ certbot_cert_path }}/privkey.pem"
    wordpress_certificate: "{{ certbot_cert_path }}/cert.pem"
    wordpress_certificate_chain: "{{ certbot_cert_path }}/fullchain.pem"

If `wordpress_create_self_signed_cert` and `wordpress_custom_cert` are set to false, my [ansible_role_certbot](https://galaxy.ansible.com/thorian93/ansible_role_certbot) will be used to acquire certificates.

    wordpress_db_system: "mysql"
    wordpress_db_name: "wordpress"
    wordpress_db_user: "wordpress"
    wordpress_db_pw: "wordpress"

Configure the database for Wordpress. Currently available is only MySQL/MariaDB.

    wordpress_redirect_http_to_https: true

Force redirect to HTTPS.

    wordpress_web_dir: "/var/www/wordpress"

The web root of your Wordpress installation.

    wordpress_backup: true
    wordpress_backup_dir: "/tmp"

Enable backup of wordpress with the shipped script and define a backup destination.

## Dependencies

  - [thorian93.ansible_role_apache2](https://galaxy.ansible.com/thorian93/ansible_role_apache2)
  - [thorian93.ansible_role_php](https://galaxy.ansible.com/thorian93/ansible_role_wordpress)
  - [thorian93.ansible_role_certbot](https://galaxy.ansible.com/thorian93/ansible_role_certbot) - when no custom or self signed certificate is used
  - [thorian93.ansible_role_mysql](https://galaxy.ansible.com/thorian93/ansible_role_mysql)

## OS Compatibility

This role ensures that it is not used against unsupported or untested operating systems by checking, if the right distribution name and major version number are present in a dedicated variable named like `<role-name>_stable_os`. You can find the variable in the role's default variable file at `defaults/main.yml`:

    role_stable_os:
      - Debian 10
      - Ubuntu 18
      - CentOS 7
      - Fedora 30

If the combination of distribution and major version number do not match the target system, the role will fail. To allow the role to work add the distribution name and major version name to that variable and you are good to go. But please test the new combination first!

Kudos to [HarryHarcourt](https://github.com/HarryHarcourt) for this idea!

## Example Playbook

    ---
    - name: "Run role."
      hosts: all
      become: yes
      roles:
        - ansible-role-wordpress

## Contributing

Please feel free to open issues if you find any bugs, problems or if you see room for improvement. Also feel free to contact me anytime if you want to ask or discuss something.

## Disclaimer

This role is provided AS IS and I can and will not guarantee that the role works as intended, nor can I be accountable for any damage or misconfiguration done by this role. Study the role thoroughly before using it.

## License

MIT

## Author Information

This role was created in 2018 by [Thorian93](http://thorian93.de/).
