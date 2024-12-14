[![ansible-lint](https://github.com/AobaIwaki123/ansible/actions/workflows/lint.yml/badge.svg)](https://github.com/AobaIwaki123/ansible/actions/workflows/lint.yml)

# 自宅サーバーの構成管理用のAnsible

## Envirionment

- Conda: 24.9.2
- Python: 3.13.0
- Ansible: 11.0.0, https://github.com/ansible/ansible
  - Ansible Core: 2.18.0

## SSH Configの設定

- `~/.ssh/config`に以下の設定を追加する

```sh
Include ~/.ssh/config.d/*.conf
```

- Ansible用のホストを`./ssh_config.d/`に設定し、以下のコマンドを実行する

```sh
$ task apply-ssh-config
```

## Ansible Roleの雛形の作成

```sh
$ task create-ansible-role -- MY_ROLE
```

## 疎通確認

```sh
$ task ping-ansible-host
```

## AnsibleのRoleやPlaybookの構文チェック

```sh
$ task lint-ansible
```

## Ansible Playbookの実行

### Roleの実行前に差分を確認

```sh
$ task check-ansible-diff -v TAG_NAME={TAG_NAME} # Tagを指定して実行
$ task check-ansible-diff -v HOST_NAME={HOST_NAME} # Hostを指定して実行
```

### Roleの実行

```sh
$ task apply-ansible-playbook -v TAG_NAME={TAG_NAME} # Tagを指定して実行
$ task apply-ansible-playbook -v HOST_NAME={HOST_NAME} # Hostを指定して実行
```

## Ansible Factsを全て表示するタスク

```yaml
- name: Print all available facts
  ansible.builtin.debug:
    var: ansible_facts
```

## 便利コマンド

- リモートに存在しないブランチとマージ済みのブランチを削除する

```sh
$ task clean-branch
```

## その他のドキュメント

- [Ansibleのコマンド例](docs/ansible-cmd.md)
- [Install Conda](docs/install-conda.md)
- [Install uv](docs/install-uv.md)

# Ref

- https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_module.html
- https://docs.ansible.com/ansible/devel/command_guide/index.html
