#!/usr/bin/env bash
set -euo pipefail

# 手動設定部
## Core Keeperのdocker-compose.ymlのあるディレクトリを指定してください
BASE_DIR="/home/hoshimikan6490/game-server_without-minecraft/core-keeper-dedicated"
## 保存するバックアップの世代数を指定してください
NUM_GENS=5

# 共通設定 (Ubuntu 向けのパスを想定)
## バックアップ先のディレクトリを指定してください
BACKUP_DIR="${BASE_DIR}/backups"
## docker-compose.ymlのパスを指定してください
DOCKER_COMPOSE_FILE="${BASE_DIR}/docker-compose-example/docker-compose.yml"
## MOD等も含めたサーバーデータ全体のディレクトリ（docker-compose.ymlのvolumesのcore-keeper-dataの項目のパス）を指定してください
WORLD_DIR="${BASE_DIR}/server-data"
## 自動バックアップ等のログが記録されるファイルを指定してください
LOG_FILE="${BASE_DIR}/log.txt"

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

log_info() { log "INFO: $1"; }
log_error() { log "ERROR: $1"; }

export BASE_DIR NUM_GENS BACKUP_DIR DOCKER_COMPOSE_FILE WORLD_DIR LOG_FILE 
