import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/company_model/company_history_model.dart';
import 'package:flutter_application_1/modules/company/company/cubit/company_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyRecipts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyCubit, CompanyState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
            title: Text(
              'Company Recipts  ',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: state is CompanyHistoryloading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.separated(
                      itemBuilder: ((context, index) =>
                          Historyview(CompanyCubit.get(context).rmodel)),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 20),
                      itemCount: 1,
                    ),
            ),
          ),
        );
      },
    );
  }
}

Widget Historyview(CompanyHistoryModel rmodel) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: rmodel.data.payments.map(
      (e) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              e.service_code ?? 'null',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    // model.data.payments.map((e) => e.date).toString(),
                    e.date ?? 'null',
                    maxLines: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: 7.0,
                    height: 7.0,
                    decoration: BoxDecoration(
                        color: Colors.blue, shape: BoxShape.circle),
                  ),
                ),
                Text(
                    // model.data.payments.map((e) => e.total).toString(),
                    e.price + ' EG' ?? 'null'),
              ],
            ),
            Divider(color: Colors.grey, thickness: 2)
          ],
        );
      },
    ).toList(),
  );
}
