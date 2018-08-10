#!/bin/sh
nvidia-smi --query-gpu=index,name,utilization.gpu,utilization.memory,memory.total,memory.free,memory.used --format=csv -l 5  > $LOG_DIR/gpulogs.log 2>&1 &

pip3 install -r requirements.txt
python3 train.py --train_article_path ${DATA_DIR}/train_and_validate_data/train.article.txt --train_title_path ${DATA_DIR}/train_and_validate_data/train.title.txt --valid_article_path ${DATA_DIR}/train_and_validate_data/valid.article.filter.txt --valid_title_path ${DATA_DIR}/train_and_validate_data/valid.title.filter.txt --results ${RESULT_DIR}/results.txt
python3 test.py