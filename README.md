[![ansible-lint](https://github.com/AobaIwaki123/ansible/actions/workflows/lint.yml/badge.svg)](https://github.com/AobaIwaki123/ansible/actions/workflows/lint.yml)

# 自宅サーバーの構成管理用のAnsible

## Envirionment

- Conda: 24.9.2
- Python: 3.13.0
- Ansible: 11.0.0, https://github.com/ansible/ansible
  - Ansible Core: 2.18.0

## SSH 設定

リポジトリのルートから実行すると、Ansible は `ssh_config.d/` の設定と
既存の `~/.ssh/config` を読み込みます。設定ファイルをホームディレクトリへ
コピーする必要はありません。秘密鍵は各自の環境に用意してください。

直接 SSH する場合は `ssh -F ssh_config k8s-ctl.vm` のように指定します。

## 疎通確認

```sh
$ task ping-ansible-hosts
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

# Ref

- https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_module.html
- https://docs.ansible.com/ansible/devel/command_guide/index.html
