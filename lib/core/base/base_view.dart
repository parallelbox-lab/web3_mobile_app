import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web3_mobile_app/core/base/base_view_model.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
final T Function(BuildContext) vmBuilder;
  final Widget Function(BuildContext, T) builder;
  const BaseView({Key? key, required this.vmBuilder, required this.builder})
      : super(key: key);
  @override
 //State<BaseView> createState() => _BaseViewState();
  _BaseViewState createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel>extends State<BaseView<T>> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
        value: widget.vmBuilder(context),
        child: Consumer<T>(
            builder: _buildScreenContent,
          ),
    );
  }

  Widget _buildScreenContent(
          BuildContext context, T viewModel, Widget? child) =>
      !viewModel.isInitialized
          ? Container(
              color: Colors.white,
              child: Center(
                  child: Container(
                      padding:const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 25),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child:const CircularProgressIndicator())),
            )
          : Stack(
              children: [
                widget.builder(context, viewModel),
                Visibility(
                    visible: viewModel.isLoading,
                    child: Center(
                        child: Container(
                            padding:const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 25),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                            child: const CircularProgressIndicator() )))
              ],
            );
}