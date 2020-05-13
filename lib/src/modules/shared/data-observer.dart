import 'package:flutter/material.dart';

class DataObserver<T>  extends StatelessWidget {

  @required
  final Stream<T> dataToObserve;

  @required
  final Function onSuccess;

  final Function onError;

  final Function onWaiting;

  DataObserver(
    {
      this.dataToObserve,
      this.onSuccess,
      this.onError,
      this.onWaiting
    }
  );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: dataToObserve,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return (onError != null) ?
            onError(context, snapshot.error) :
            _defaultErrorHandler(context, snapshot.error);
        }

        if (snapshot.hasData) {
          T data = snapshot.data;
          return onSuccess(context, data);
        } else {
          return (onWaiting != null) ?
            onWaiting(context) :
            _defaultWaiting(context);
        }
      },
    );
  }

  Widget _defaultWaiting(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _defaultErrorHandler(BuildContext context, Object error) {
    return Center(child: Text('Ocurrió un error inesperado', style: TextStyle(fontSize: 40)),);
  }
}