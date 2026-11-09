# WebHocTiengAnh — bản nâng cấp

Ứng dụng học từ vựng tiếng Anh bằng flashcard, dùng HTML/CSS/JavaScript và lưu tiến độ trong `localStorage` của trình duyệt.

## Tính năng mới

- **Flashcard ngược Việt → Anh:** nhấn nút ở đầu trang học để đổi giữa `EN → 🇻🇳` và `🇻🇳 → EN`. Chế độ được lưu trong trình duyệt và có thể cài mặc định trong trang Hồ sơ.
- **Hai bộ CSV mới:** `Phrasal_Verbs.csv` gồm 61 cụm động từ và `Noun_Phrases.csv` gồm 59 cụm danh từ. Mỗi CSV dùng cùng cấu trúc cột mà ứng dụng đang nhận diện: `Từ vựng`, `Phiên âm`, `Nghĩa`, `Loại từ`, `Ví dụ`, `Ghi chú`.
- **100 từ mỗi ngày:** nếu chưa học một bộ từ/chủ đề cụ thể, trang học chọn tối đa 100 từ khác nhau từ các bộ dữ liệu đã nạp. Danh sách được xáo trộn theo ngày địa phương nên ổn định trong cùng ngày và thay đổi sang ngày mới.
- **Giữ dữ liệu gốc:** ba bộ từ ban đầu và phần theo dõi tiến độ học vẫn được giữ lại. Bản `index.html` trước nâng cấp nằm trong `backup/index.before-upgrade.html`.

## Cấu trúc thư mục

```text
webHocTiengAnh_nangcap/
├── index.html
├── Advanced_Vocab_-_Designed_for_targets_65_and_above_2026-09-26.csv
├── Basic_Vocab_-_Recommended_for_targets_below_65_2026-09-26.csv
├── Vocab_-_General_Vocab_-_Suitable_for_all_target_scores_2026-09-26.csv
├── Phrasal_Verbs.csv
├── Noun_Phrases.csv
├── run_hocTiengAnh.bat
├── init
├── README.md
└── backup/
    └── index.before-upgrade.html
```

## Chạy trên Windows

1. Giải nén toàn bộ ZIP vào một thư mục.
2. Cài Python 3 nếu máy chưa có.
3. Nhấn đúp `run_hocTiengAnh.bat`. Trình duyệt sẽ mở `http://127.0.0.1:8000/index.html`.
4. Để dừng máy chủ, đóng cửa sổ dòng lệnh **English Vocab server**.

Không mở trực tiếp bằng `file://`: trình duyệt có thể chặn `fetch()` đọc các CSV cùng thư mục.

## Chạy thủ công

Mở Terminal/PowerShell tại thư mục project và chạy:

```bash
python -m http.server 8000 --bind 127.0.0.1
```

Sau đó truy cập `http://127.0.0.1:8000/index.html`.

## Đẩy lên GitHub Pages

Commit `index.html`, cả **năm CSV**, và các file bạn muốn giữ lại lên cùng thư mục gốc của repository. Các bộ CSV phải giữ nguyên tên vì ứng dụng dùng tên file để tự nạp dữ liệu.

## Ghi chú

- Phiên bản vẫn chạy hoàn toàn phía trình duyệt, không cần backend.
- Tiến độ và chế độ flashcard được lưu theo địa chỉ website trong `localStorage`. Khi đổi từ địa chỉ website khác sang localhost hoặc ngược lại, dữ liệu trình duyệt không tự chuyển theo.
- Việc kiểm tra kèm theo gói này gồm kiểm tra cú pháp JavaScript bằng Node.js, cấu trúc/số lượng hàng CSV và logic chọn danh sách 100 từ ổn định theo ngày. Chưa có kiểm thử giao diện tự động trên mọi trình duyệt/thiết bị.
