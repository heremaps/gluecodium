// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2020 HERE Europe B.V.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0
// License-Filename: LICENSE
//
// -------------------------------------------------------------------------------------------------

#include "test/MultiSender.h"
#include "test/ReceiverA.h"
#include "test/ReceiverB.h"
#include <vector>

namespace test {

struct SenderImpl : public MultiSender {
  void add_receiver_a(const std::shared_ptr<ReceiverA>& receiver) override;
  void add_receiver_b(const std::shared_ptr<ReceiverB>& receiver) override;

  void notify_a_receivers() override;
  void notify_b_receivers() override;

  std::vector<std::shared_ptr<ReceiverA>> a_receivers;
  std::vector<std::shared_ptr<ReceiverB>> b_receivers;
};

std::shared_ptr<MultiSender>
MultiSender::create() {
    return std::make_shared<SenderImpl>();
}

void
SenderImpl::add_receiver_a(const std::shared_ptr<ReceiverA>& receiver) {
    a_receivers.push_back(receiver);
}

void
SenderImpl::add_receiver_b(const std::shared_ptr<ReceiverB>& receiver) {
    b_receivers.push_back(receiver);
}

void
SenderImpl::notify_a_receivers() {
    for (const auto& receiver: a_receivers) {
       receiver->receive_a("Sent from A");
    }
}

void SenderImpl::notify_b_receivers() {
    for (const auto& receiver: b_receivers) {
       receiver->receive_b("Sent from B");
    }
}

}
