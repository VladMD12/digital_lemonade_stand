import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../tokens.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Tokens.text),
          onPressed: () => context.pop(),
        ),
        title: const Text('Your Order'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final contentWidth = constraints.maxWidth;
          const horizontalPadding = Tokens.pApp * 2;
          final availableWidth =
              (contentWidth - horizontalPadding).clamp(0.0, contentWidth);
          final columns = _columnsForWidth(availableWidth);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(Tokens.pApp),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _OrderSection(
                    title: 'Contact Information',
                    columns: columns,
                    children: const [
                      _OrderField(
                        label: 'First name',
                        initialValue: 'Jane',
                        textInputAction: TextInputAction.next,
                      ),
                      _OrderField(
                        label: 'Last name',
                        initialValue: 'Doe',
                        textInputAction: TextInputAction.next,
                      ),
                      _OrderField(
                        label: 'Email address',
                        initialValue: 'jane@example.com',
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                      _OrderField(
                        label: 'Phone number (10 digits)',
                        initialValue: '4161234567',
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  _OrderSection(
                    title: 'Payment',
                    columns: columns,
                    children: const [
                      _OrderField(
                        label: 'Cardholder name',
                        initialValue: 'Jane Doe',
                        textInputAction: TextInputAction.next,
                      ),
                      _OrderField(
                        label: 'Card number',
                        initialValue: '4242 4242 4242 4242',
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                      ),
                      _OrderField(
                        label: 'Expiry (MM/YY)',
                        initialValue: '12/28',
                        keyboardType: TextInputType.datetime,
                        textInputAction: TextInputAction.next,
                      ),
                      _OrderField(
                        label: 'CVV',
                        initialValue: '123',
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _OrderSection extends StatelessWidget {
  const _OrderSection({
    required this.title,
    required this.children,
    required this.columns,
  });

  final String title;
  final List<_OrderField> children;
  final int columns;

  @override
  Widget build(BuildContext context) {
    const spacing = 20.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Tokens.muted,
              ),
        ),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;
            final itemWidth = _fieldWidthFor(maxWidth, columns, spacing);
            return Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: [
                for (final child in children)
                  SizedBox(
                    width: itemWidth,
                    child: child,
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _OrderField extends StatelessWidget {
  const _OrderField({
    required this.label,
    required this.initialValue,
    this.keyboardType,
    this.textInputAction,
  });

  final String label;
  final String initialValue;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}

int _columnsForWidth(double width) {
  if (width >= 1100) return 3;
  if (width >= 700) return 2;
  return 1;
}

double _fieldWidthFor(double maxWidth, int columns, double spacing) {
  if (columns <= 1) return maxWidth;
  final gaps = spacing * (columns - 1);
  return (maxWidth - gaps) / columns;
}
