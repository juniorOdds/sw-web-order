# เปลี่ยนจาก ruby:3.1 เป็น ruby:3.3.1
FROM ruby:3.3.1

# ติดตั้ง dependencies
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  yarn

# กำหนด directory ทำงาน
WORKDIR /app

# คัดลอก Gemfile และ Gemfile.lock
COPY Gemfile Gemfile.lock ./

# ติดตั้ง gems
RUN bundle install

# คัดลอกไฟล์โปรเจคทั้งหมด
COPY . .

# กำหนดพอร์ตที่จะเปิดใช้
EXPOSE 3000

# คำสั่งในการรัน server
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
