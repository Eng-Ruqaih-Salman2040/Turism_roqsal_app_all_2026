import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Rating_control.dart'; // تأكد أن اسم الكنترولر داخل هذا الملف: class RatingController extends GetxController

class Rating_screen extends StatelessWidget {
  const Rating_screen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<RatingController>();

    return Scaffold(
      appBar: AppBar(title: Text(c.shopName ?? 'التقييمات')),
      body: Obx(() {
        if (c.loading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return RefreshIndicator(
          onRefresh: c.initData,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("متوسط: ${c.avg.value} / 5"),
                  Text("(${c.total.value} تقييم)"),
                ],
              ),
              const SizedBox(height: 12),

              // اختيار النجوم (مغلف بـ Obx حتى يتحدث عند تغيير selected)
              Obx(() => Row(
                children: List.generate(5, (i) {
                  final filled = i < c.selected.value;
                  return IconButton(
                    icon: Icon(
                      filled ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                    ),
                    onPressed: () => c.selected.value = i + 1,
                  );
                }),
              )),

              // التعليق
              TextField(
                controller: c.commentCtl,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: "اكتب تعليقك (اختياري)",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),

              // زر الإرسال
              Obx(() => ElevatedButton.icon(
                onPressed: c.sending.value ? null : c.send,
                icon: c.sending.value
                    ? const SizedBox(
                    height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2))
                    : const Icon(Icons.send),
                label: const Text("إرسال التقييم"),
              )),

              const Divider(height: 32),

              // قائمة التقييمات
              ...c.ratings.map((r) => ListTile(
                leading: Text("${r.rating}⭐"),
                title: Text(r.userName),
                subtitle: Text(r.comment.isEmpty ? "بدون تعليق" : r.comment),
                trailing: Text(r.createdAt, style: const TextStyle(fontSize: 12)),
              )),
              if (c.ratings.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(child: Text("لا توجد تقييمات بعد")),
                ),
            ],
          ),
        );
      }),
    );
  }
}