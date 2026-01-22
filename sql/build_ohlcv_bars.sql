WITH base_trades AS (
    SELECT
        trade_date,
        time_bucket(INTERVAL '{bar_interval}', event_time) AS bar_start,
        price,
        quantity,
        is_buyer_maker,
        event_time
    FROM read_parquet('{processed_base_path}/**/*.parquet')
    WHERE trade_date BETWEEN DATE '2025-01-01' AND DATE '2026-01-22'
)

SELECT
    trade_date,
    bar_start,
    arg_min(price, event_time) AS open,
    max(price) AS high,
    min(price) AS low,
    arg_max(price, event_time) AS close,
    sum(quantity) AS volume,
    sum(CASE WHEN is_buyer_maker = FALSE THEN quantity ELSE 0 END) AS buy_volume,
    sum(CASE WHEN is_buyer_maker = TRUE THEN quantity ELSE 0 END) AS sell_volume
FROM base_trades
GROUP BY trade_date, bar_start
ORDER BY bar_start;
