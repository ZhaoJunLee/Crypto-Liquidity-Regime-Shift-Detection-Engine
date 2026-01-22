COPY (
    SELECT
        column0::BIGINT AS agg_trade_id,
        column1::DOUBLE AS price,
        column2::DOUBLE AS quantity,
        column3::BIGINT AS first_trade_id,
        column4::BIGINT AS last_trade_id,
        TO_TIMESTAMP(column5::BIGINT / 1000000) AS event_time,
        CAST(TO_TIMESTAMP(column5::BIGINT / 1000000) AS DATE) AS trade_date,
        column6::BOOLEAN AS is_buyer_maker
    FROM read_csv(
        '{csv_pattern}',
        HEADER=FALSE,
        DELIM=',',
        AUTO_DETECT=FALSE,
        COLUMNS={
            'column0': 'BIGINT',
            'column1': 'DOUBLE',
            'column2': 'DOUBLE',
            'column3': 'BIGINT',
            'column4': 'BIGINT',
            'column5': 'BIGINT',
            'column6': 'BOOLEAN',
            'column7': 'BOOLEAN'
        },
        STRICT_MODE=FALSE
    )
)
TO '{processed_path}' (
    FORMAT PARQUET,
    PARTITION_BY (trade_date),
    OVERWRITE_OR_IGNORE
);
