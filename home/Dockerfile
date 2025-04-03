# Sử dụng image Python nhẹ
FROM python:3.11-slim

# Thiết lập biến môi trường tối ưu
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on

# Cài đặt các gói hệ thống cần thiết
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Thiết lập thư mục làm việc
WORKDIR /app

# Cài đặt dependencies trước để tận dụng cache
COPY requirements.txt .
RUN pip install -r requirements.txt

# Sao chép mã nguồn
COPY . .

# Thu thập static files
RUN python manage.py collectstatic --noinput

# Quyền thực thi cho entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose cổng cho Gunicorn
EXPOSE 8000

# Sử dụng entrypoint để chạy migrations và Gunicorn
ENTRYPOINT ["/entrypoint.sh"]